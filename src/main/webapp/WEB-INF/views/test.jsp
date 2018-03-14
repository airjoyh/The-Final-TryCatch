<%@page import="kr.co.trycatch.common.CompileHandler"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="org.apache.commons.exec.CommandLine"%>
<%@page import="org.apache.commons.exec.DefaultExecutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%! 
   public void test(String...args){
	   /* DefaultExecutor executor = new DefaultExecutor();
	   CommandLine cmdLine = CommandLine.parse(args[0]);
	   
	   for(int i=1; i<args.length; i++){
		   cmdLine.addArgument(args[i]);
	   }
	   executor.execute(cmdLine); */
	   /* ProcessBuilder builder = new ProcessBuilder(args);
	   builder.redirectOutput(Redirect.INHERIT);
	   builder.redirectError(Redirect.INHERIT);
	   builder.start(); */
   }

%>
<body>
  <h3>test.jsp</h3>
  <%
     CompileHandler ch = new CompileHandler();
     ch.javac("cmd","/c","javac c:/coding/A.java");
     
     ch.java("cmd","/c","java -classpath c:/coding A");
  %>
</body>
</html>