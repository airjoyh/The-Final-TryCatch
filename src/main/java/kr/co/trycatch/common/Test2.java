package kr.co.trycatch.common;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.ExecuteException;
import org.apache.commons.exec.ExecuteStreamHandler;
import org.apache.commons.exec.PumpStreamHandler;

public class Test2 {
   public void javac(String...args) throws IOException {
	   /*ProcessBuilder builder = new ProcessBuilder(args);
	   builder.redirectOutput(Redirect.INHERIT);
	   builder.redirectError(Redirect.INHERIT);
	   builder.start();*/
	   DefaultExecutor executor = new DefaultExecutor();
	   CommandLine cmdLine = CommandLine.parse(args[0]);
	   
	   for(int i=1; i<args.length; i++){
		   cmdLine.addArgument(args[i]);
	   }
	   executor.execute(cmdLine);
	   
   }
   
   public void java(String...args) throws ExecuteException, IOException {
	   /*Process pro2 = new ProcessBuilder(args).start();
	     BufferedReader br3 = new BufferedReader(new InputStreamReader(pro2.getInputStream()));
	     BufferedReader br4 = new BufferedReader(new InputStreamReader(pro2.getErrorStream()));
	     
	     String str2;
	     while((str2=br3.readLine())!= null) {    	 
	         System.out.println(str2);
	     }*/
	   DefaultExecutor executor = new DefaultExecutor();
	   CommandLine cmdLine = CommandLine.parse(args[0]);
	   
	   for(int i=1; i<args.length; i++){
		   cmdLine.addArgument(args[i]);
	   }
	   
	   ExecuteStreamHandler esh = new PumpStreamHandler(new FileOutputStream("c:/jaelee/print.txt"));
	   executor.setStreamHandler(esh);//밑의 기본 콘솔 출력을 ----> 파일 출력으로!!
	   executor.execute(cmdLine);//기본 콘솔 출력!!
	 
	   
	   
	   
   }
}
