package org.ada.business.logic.config;

import java.io.IOException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.ada.business.logic.configuracion.AsyncExecutor;
import org.ada.business.logic.configuracion.AsyncManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@EnableTransactionManagement
@EnableAsync   
@Configuration
@EnableCaching
@MapperScan("org.ada.data.access.**.mapper")
public class AppConfig implements EnvironmentAware{

	private static Logger logger = Logger.getLogger(AppConfig.class);
	
	@Autowired
    Environment env;


	static {
		System.setProperty("java.awt.headless", "true");
	}

	@Bean(destroyMethod="")
	public DataSource getDataSource() {

		if(logger.isDebugEnabled()){
			logger.debug("getDataSource");				
		}

		InitialContext ic2;
		DataSource ds = null;
		try {
			ic2 = new InitialContext();
			ds = (DataSource) ic2.lookup("ADADS");
		} catch (NamingException e) {
			logger.error(e.getMessage(), e);		
		}		  

		return ds;
	}

	@Bean
	public DataSourceTransactionManager transactionManager() {
		if(logger.isDebugEnabled()){
			logger.debug("transactionManager");				
		}
		//		System.out.println("transactionManager");
		return new DataSourceTransactionManager(getDataSource());
	}

	@Bean
	@Autowired
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource) throws IOException {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		PathMatchingResourcePatternResolver pathM3R = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(pathM3R.getResources("classpath*:org/ada/data/access/percistencia/mapper/*.xml"));
		return sqlSessionFactoryBean;
	}

	@Bean
	public MapperScannerConfigurer mapperScannerConfigurer() {
		MapperScannerConfigurer mapperScannerConfigurer =
				new MapperScannerConfigurer();
		mapperScannerConfigurer.setBasePackage("org.ada.data.access.**.mapper");
		mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactoryBean");
		return mapperScannerConfigurer;
	}



	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(20971520);
		return resolver;
	}

	@Bean
	public AsyncManager asyncManger() {
		return new AsyncManager();
	}

	@Bean
	public AsyncExecutor asyncExecutor() {
		return new AsyncExecutor();
	}



	@Bean
	public ThreadPoolTaskScheduler threadPoolTaskScheduler() {
		ThreadPoolTaskScheduler threadPoolTaskScheduler = new ThreadPoolTaskScheduler();
		threadPoolTaskScheduler.setPoolSize(5);
		threadPoolTaskScheduler.setThreadNamePrefix("ThreadPoolTaskScheduler");
		return threadPoolTaskScheduler;
	}





	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}


	@Bean
	public CacheManager cacheManager() {
		return new EhCacheCacheManager(ehCacheCacheManager().getObject());
	}

	@Bean
	public EhCacheManagerFactoryBean ehCacheCacheManager() {
		EhCacheManagerFactoryBean factory = new EhCacheManagerFactoryBean();
		factory.setConfigLocation(new ClassPathResource("ehcache.xml"));
		factory.setShared(true);
		return factory;
	}

	@Override
	public void setEnvironment(Environment environment) {
		 this.env = environment;

	}


}
