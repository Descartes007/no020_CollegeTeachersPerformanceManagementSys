/**
 * 初始化ajax
 * @constructor
 */
function AJAX()
{
	this.Http = false;
	this.Http = this.createXMLHttpRequest();   // 创建xmlHttp
	this.value = null;
	this.xmlValue = null;
	this.state = false;
}

/**
 * 作者
 */
AJAX.prototype.author = function()
{
	alert("ajax for liyuanchao\n2007-12-01");
}
/**
 * 弹出使用方法
 */
AJAX.prototype.help = function()
{
	var str = "var ajax = new AJAX();\n";
	    str += "ajax.post(url);\n";
	    str += "if(ajax.isOK()) \n{\n    var value = ajax.getValue();\n}";
	alert(str);
}
/**
 * 根据浏览器创建 XMLHttpRequest 对象
 * @returns {XMLHttpRequest|any}
 */
AJAX.prototype.createXMLHttpRequest = function()
{
 if(window.ActiveXObject)
 return new ActiveXObject("Microsoft.XMLHTTP");
 else if(window.XMLHttpRequest)
 return new XMLHttpRequest();
}
/**
 * 使用post 提交到后台,并使用的是同步操作
 * @param url
 */
AJAX.prototype.post = function(url)
{
	this.Http.open("POST", url, false);
	this.Http.send(null);
	if(this.Http.readyState==4)
	{
		if(this.Http.status==200)
		{
			this.state = true;
			this.value = this.Http.responseText;
			this.xmlValue = this.Http.responseXML;
		}
	}
}
/**
 * 获取提交的结果
 * @returns {null|*}
 */

AJAX.prototype.getValue = function()
{
	return this.value;
}
/**
 * 获取xml 的结果
 * @returns {null|*}
 */
AJAX.prototype.getXmlValue = function()
{
	return this.xmlValue;
}
/**
 * 获取结果
 * @returns {boolean}
 */
AJAX.prototype.isOK = function()
{
	return this.state;
}
