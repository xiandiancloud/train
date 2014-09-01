/*
用途：检查输入字符串是否为空或者全部都是空格
输入：str
返回：
如果全是空返回true,否则返回false
*/
function isNull( str ){
if ( str == "" ) return true;
var regu = "^[ ]+$";
var re = new RegExp(regu);
return re.test(str);
} 
/**
 * 检查两个字符是否相等
 * @return
 */
function isEquals(str1,str2)
{
	if(str1!=str2)
	{
		return false;
	}
	else return true;
}
/*
用途：检查输入手机号码是否正确
输入：
s：字符串
返回：
如果通过验证返回true,否则返回false
*/
function checkMobile( s )
{  
	/*var regu =/^[1][3][0-9]{9}$/;
	var re = new RegExp(regu);
	if (re.test(s)) {
	return true;
	}else{
	return false;
	}*/
	return/^(13|15|17|18)\d{9}$/i.test(s);
}
/*
用途：检查输入对象的值是否符合E-Mail格式
输入：str 输入的字符串
返回：如果通过验证返回true,否则返回false
*/
function isEmail( str ){ 
var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
if(myReg.test(str)) return true;
return false;
}
/*
用途：检查输入对象的值是否符合整数格式
输入：str 输入的字符串
返回：如果通过验证返回true,否则返回false
*/
function isInteger( str ){ 
var regu = /^[-]{0,1}[0-9]{1,}$/;
return regu.test(str);
}
function replaceTextarea1(str){
    var reg=new RegExp("\r\n","g");
    var reg1=new RegExp("\n","g");
    str = str.replace(reg,"</iebr>");
    str = str.replace(reg1,"</br>");
    return str;
}
function replaceTextarea2(str){
    var reg=new RegExp("</iebr>","g");
    var reg1=new RegExp("</br>","g");
    str = str.replace(reg,"\r\n");
    str = str.replace(reg1,"\n");
    return str;
}