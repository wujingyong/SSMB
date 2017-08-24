package com.wjy.configuration;

import java.beans.PropertyVetoException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@PropertySource(value = { "classpath:jdbc.properties" })
public class ApplicationContext {
	@Autowired
	private Environment env;
	
	@Value("${driver}")
	private String driverClass;
	
	@Value("${url}")
	private String jdbcUrl;
	
	@Value("${user}")
	private String user;
	
	@Value("${password}")
	private String password;
	
	@Bean(destroyMethod="close")
	public ComboPooledDataSource dataSource(){
		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		try {
//			dataSource.setDriverClass(driverClass);
			dataSource.setDriverClass(env.getProperty("driver"));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
//		dataSource.setJdbcUrl(jdbcUrl);
//		dataSource.setUser(user);
//		dataSource.setPassword(password);
		dataSource.setJdbcUrl(env.getProperty("url"));
		dataSource.setUser(env.getProperty("user"));
		dataSource.setPassword(env.getProperty("password"));
		return dataSource;
	}
}
