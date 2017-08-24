package com.wjy.configuration;


import org.apache.ibatis.type.Alias;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
//自动扫描mapper文件
@MapperScan("com.wjy.mybatis.dao")
@Alias(value = "com.wjy.mybatis.entity")
@AutoConfigureAfter(value=ApplicationContext.class)
public class MyBatisConfig {

	@Profile(value = { "dev" })
//	@Conditional(value = { MyConditional.class })
	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean(ComboPooledDataSource dataSource){
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource);
		/*sqlSessionFactory.setTypeAliasesPackage("com.wjy.mybatis.entity");*/
		ResourcePatternResolver resourcePatternResolver = new  PathMatchingResourcePatternResolver();
		
		Resource configLocation = resourcePatternResolver.getResource("classpath:mybatis-config.xml");
		sqlSessionFactory.setConfigLocation(configLocation);
        //添加XML目录
        try {
        	sqlSessionFactory.setMapperLocations(resourcePatternResolver.getResources("classpath:mapper/*.xml"));
            return sqlSessionFactory;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
	}
}
