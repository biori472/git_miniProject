package spring.conf;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

//@EnableTransactionManagement
@Configuration
public class SpringConfiguration {//db 공장 과 같은 의미. 부품이 여기 들어가있음.
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Bean
	public DataSource dataSource() {
		BasicDataSource basicDataSouece = new BasicDataSource();
		basicDataSouece.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		basicDataSouece.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		basicDataSouece.setUsername("c##java");
		basicDataSouece.setPassword("bit");
		basicDataSouece.setMaxTotal(20);
		basicDataSouece.setMaxIdle(3);
		return basicDataSouece;
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {//xml가져오는 애, 얘가 있어야 sqlsession만들 수 있음 
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setConfigLocation(
				new PathMatchingResourcePatternResolver().getResource("classpath:spring/mybatis-config.xml"));
		//	sqlSessionFactoryBean.setConfigLocation(new ClassPathResuorce("경로위치"));*경로위치에 classpath빼기~
		sqlSessionFactoryBean.setDataSource(dataSource());
		//sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResource("classpath:member/dao/memberMapper.xml"));
		//sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:*/dao/*Mapper.xml"));
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:*/dao/*Mapper.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());//sqlsession만드려면 sqlSessionFactory()필요. 
	}

	/*Mybatis 에서 commit(); 의 기능  + rollback();  = @EnableTransactionManagement*/
	@Bean
	public DataSourceTransactionManager transactionManager() { 
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource(dataSource());
		return dataSourceTransactionManager;
	} 


}
