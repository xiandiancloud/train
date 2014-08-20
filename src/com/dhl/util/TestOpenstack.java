/*package com.dhl.util;

import java.util.List;


import org.openstack.keystone.KeystoneClient;
import org.openstack.keystone.api.Authenticate;
import org.openstack.keystone.api.ListTenants;
import org.openstack.keystone.model.Access;
import org.openstack.keystone.model.Authentication;
import org.openstack.keystone.model.Authentication.PasswordCredentials;
import org.openstack.keystone.model.Authentication.Token;
import org.openstack.keystone.model.Tenants;
import org.openstack.keystone.utils.KeystoneUtils;
import org.openstack.nova.NovaClient;
import org.openstack.nova.api.FlavorsCore;
import org.openstack.nova.api.ImagesCore;
import org.openstack.nova.api.ServersCore;
import org.openstack.nova.api.extensions.FloatingIpsExtension;
import org.openstack.nova.api.extensions.KeyPairsExtension;
import org.openstack.nova.api.extensions.SecurityGroupsExtension;
import org.openstack.nova.model.Flavor;
import org.openstack.nova.model.Flavors;
import org.openstack.nova.model.FloatingIp;
import org.openstack.nova.model.FloatingIps;
import org.openstack.nova.model.Image;
import org.openstack.nova.model.Images;
import org.openstack.nova.model.KeyPair;
import org.openstack.nova.model.KeyPairs;
import org.openstack.nova.model.SecurityGroup;
import org.openstack.nova.model.SecurityGroups;
import org.openstack.nova.model.Server;
import org.openstack.nova.model.ServerForCreate;
import org.openstack.nova.model.Servers;




public class TestOpenstack {

    private static final String KEYSTONE_AUTH_URL = "http://192.168.120.228:5000/v2.0";  // 之前使用35357 总是获得不了 tenant 表信息  估计是 api发布者的一个 失误

    private static final String KEYSTONE_USERNAME = "admin";

    private static final String KEYSTONE_PASSWORD = "admin";
    
    private static    NovaClient novaClient;


     
    public static void Init() {
        KeystoneClient keystone = new KeystoneClient(KEYSTONE_AUTH_URL);
        Authentication authentication = new Authentication();
        PasswordCredentials passwordCredentials = new PasswordCredentials();
        passwordCredentials.setUsername(KEYSTONE_USERNAME);
        passwordCredentials.setPassword(KEYSTONE_PASSWORD);
        authentication.setPasswordCredentials(passwordCredentials);
        
        //access with unscoped token
        Access access = keystone.execute(new Authenticate(authentication));
        
        //use the token in the following requests
        keystone.setToken(access.getToken().getId());
        
        Tenants     tenants = keystone.execute(new ListTenants());
        
        //try to exchange token using the first tenant
        if(tenants.getList().size() > 0) {
            authentication = new Authentication();
            Token token = new Token();
            token.setId(access.getToken().getId());
            authentication.setToken(token);
            authentication.setTenantId(tenants.getList().get(0).getId());
            access = keystone.execute(new Authenticate(authentication));
             novaClient = new NovaClient(KeystoneUtils.findEndpointURL(access.getServiceCatalog(), "compute", null, "public"), access.getToken().getId());
        } else {
            System.out.println("No tenants found!");
        }
        
    }
    

    
    public static void main(String[] args) {
        Init();    
        ListService();//
        ListImage();
        ListSecurityGroup();
        ListFlavor();
        GetFlavorModel();
        ListServerDetail();
        //ShowService();
        ListKeyPairs();
        //GetKeyPariModel();
        ListImage();
        //GetImageModel();
        ListFloatingIp();//由于系统中还没有创建floatingip 所以目前出错
        //CreateServer();
    }
    
    
    public static void printObject(Object obj){
        System.out.println(obj.getClass()+"   "+obj);
    }
    
    //------------查看平台-------
       //查看平台中正在运行的server
        public static void ListService(){
            Servers servers = novaClient.execute(ServersCore.listServers());
            for (Server server : servers) {
                System.out.println(server);
            }
        }
        public static void ListServerDetail(){
            Servers servers = novaClient.execute(ServersCore.listServers(true));
            for(Server server:servers){
                printObject(server);
            }
        }
        public static void ShowService(){
            Server server = novaClient.execute(ServersCore.showServer("2eb8f6c8-22b7-4e7e-95bc-80d48801106d"));
            printObject(server);
        }
        
        public static void ListImage(){
            //通过novaclient查看平台中的image
              Images images = novaClient.execute(ImagesCore.listImages());
             //Images images = novaClient.execute(MyOpenstackGlance.myListImages());//自己实现一个
              for(Image image :images){
                  System.out.println(image);
              }
        }
        
        
        
        public static void ListKeyPairs(){
             //查看keypair
              KeyPairs keypairs = novaClient.execute(KeyPairsExtension.listKeyPairs());
              for(KeyPair keypair:keypairs){
                   System.out.println(keypair);
              }
        }
        public static void ListSecurityGroup(){
            //查看SecurityGroup
              SecurityGroups securityGroups = novaClient.execute(SecurityGroupsExtension.listSecurityGroups());
              for(SecurityGroup sg :securityGroups){
                  System.out.println(sg);
              }
        }    
        
        public static void ListFlavor(){
//            Flavors flavors = novaClient.execute(FlavorsCore.listFlavors());//
            Flavors flavors = novaClient.execute(FlavorsCore.listFlavors());
            for(Flavor flavor :flavors){
                    System.out.println(flavor.getId());
            }
        }
        public static void ListFloatingIp(){
          
            FloatingIps floatingIps =   novaClient.execute(FloatingIpsExtension.listFloatingIps());
            for(FloatingIp floatingIp :floatingIps){
                printObject(floatingIp);
            }
        }
        public static void ListFixIp(){
        }
//------获得信息------
        //获得SecuritGroup model
        public static SecurityGroup GetSecurityGroup(int index){
            SecurityGroup sg = null ;
            SecurityGroups sgs = novaClient.execute(SecurityGroupsExtension.listSecurityGroups());
            List<SecurityGroup> alist =     sgs.getList();
            if(alist.size() >index-1){
                 sg = (SecurityGroup)alist.get(index);
            }            
            return sg;
        }
        //获得Flavor model
        public static Flavor GetFlavorModel(){
            Flavor flavor  = null;
            Flavors flavors = novaClient.execute(FlavorsCore.listFlavors());
            List<Flavor> flavorList = flavors.getList();
            if(flavorList.size()>0){
                flavor = (Flavor)flavorList.get(0);
            }
            printObject(flavor);
            return flavor;
        }
        //获得key model
        public static KeyPair GetKeyPariModel(){
            KeyPair keypair = null;
            KeyPairs keypairs = novaClient.execute(KeyPairsExtension.listKeyPairs());
            List<KeyPair> keypairList = keypairs.getList();
            if(keypairList.size()>0){
                keypair = keypairList.get(0);
            }
            printObject(keypair);
            return keypair;
        }
        //获得 image model
        public static Image GetImageModel(){
            Image image =null;
            Images images = novaClient.execute(ImagesCore.listImages());
            List<Image> imageList = images.getList();
            if(imageList.size() >0){
                image = imageList.get(0);
            }
           printObject(image);
            return image;
        }
// -----------------------------------
        //        create security group
        public static void CreateSecurityGroup (){    
            SecurityGroup securityGroup = novaClient.execute(SecurityGroupsExtension.createSecurityGroup("GroupSecrityForLostTest", "This securityGroup is Create for lost ,just for test"));
            novaClient.execute(SecurityGroupsExtension.createSecurityGroupRule(securityGroup.getId(), "UDP", 9090, 9092, "0.0.0.0/0"));
            novaClient.execute(SecurityGroupsExtension.createSecurityGroupRule(securityGroup.getId(), "TCP", 8080, 8080, "0.0.0.0/0"));
            System.out.println(securityGroup);
        }
        
        //create keypair 
        public static void CreateKeyPair(){ //          创建一个keypair
               KeyPair keyPair = novaClient.execute(KeyPairsExtension.createKeyPair("mykeypair"));//keypair name 所必须唯一的
             System.out.println(keyPair.getPrivateKey());
        }
        
      // 创建一个server
        public static void CreateServer(){
            
            ServerForCreate serverForCreate = new ServerForCreate();
            serverForCreate.setName("CreateByLost");
            serverForCreate.setFlavorRef(GetFlavorModel().getId());
            serverForCreate.setImageRef(GetImageModel().getId());
            serverForCreate.setKeyName(GetKeyPariModel().getName());
            serverForCreate.getSecurityGroups().add(new ServerForCreate.SecurityGroup("default"));
            serverForCreate.getSecurityGroups().add(new ServerForCreate.SecurityGroup(GetSecurityGroup(1).getName()));
            Server server = novaClient.execute(ServersCore.createServer(serverForCreate));
            System.out.println(server);
        }

}
*/