package com.dhl.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Element;

/**
 * dom4j框架读取并解析xml
 * 
 * 
 */
public class ParseXml
{
	//获取节点下面的所有节点
	@SuppressWarnings("unchecked")
	public static List<Element> getChildNode(Element element){
		List<Element> childList = element.elements();
		return childList;
	}
	//获取元素的属性集
	public static Map<String,String> getNodeAttrName(Element element){
		int n=element.attributeCount();
		Map<String,String> attrname=new HashMap<String,String>();
		for(int i=0;i<n;i++){
			String name=element.attribute(i).getName();
			attrname.put(name, element.attributeValue(name));
		}
		return attrname;
	}
/*	public static void main(String[] args) throws Exception{
		ParseXml p=new ParseXml("student.xml");
		List<Element> childList2 = p.getChildNode(root);
		for(int i=0;i<childList2.size();i++){
			Map<String,String> map=p.getNodeAttrName(childList2.get(i));
			System.out.println("value:" + map.get("学号"));
		}
		Element el=childList2.get(1);
		Map<String,String> map=p.getNodeAttrName(el);
		System.out.println(el.getName());
		Iterator it = map.keySet().iterator();  
        while(it.hasNext()) {  
            String key = (String)it.next();  
            System.out.println("key:" + key);  
            System.out.println("value:" + map.get(key));  
        }
	}*/
}
