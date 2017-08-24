package com.wjy.configuration;
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.env.Environment;
import org.springframework.core.type.AnnotatedTypeMetadata;
public class MyConditional implements Condition{

	@Override
	public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
		Environment env = context.getEnvironment();
		String[] activeProfiles = env.getActiveProfiles();
		System.out.println(env.acceptsProfiles("dev"));
		System.out.println(env.acceptsProfiles("abc"));
		System.out.println(env.acceptsProfiles("aaa"));
		for(String str :activeProfiles){
			if(str.equals("dev")){
				return true;
			}
		}
		return false;
	}


}
