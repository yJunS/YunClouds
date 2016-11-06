package com.ceecloud.util;

import org.apache.log4j.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class DomainProperties implements ServletContextListener{
	private static final Logger LOG = Logger.getLogger(DomainProperties.class);
	private static  String propertyUrl = "/domain.properties";
	private static Properties property;
    /**
     * Searches for the property with the specified key in this property list.
     * If the key is not found in this property list, the default property list,
     * and its defaults, recursively, are then checked. The method returns
     * <code>null</code> if the property is not found.
     *
     * @param   key   the property key.
     * @return  the value in this property list with the specified key value.
     * @see     #setProperty
     * @see     #defaults
     */
    public static String getProperty(String key) {
    	
    	//system.out.println("pp");
        InputStream is = null;
		
		//system.out.println("tt");
		is = DomainProperties.class.getResourceAsStream(propertyUrl);
		property = new Properties();
		//system.out.println("pp");
		try {
			property.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOG.debug(e.getStackTrace());
		}
    	/*ApplicationProperties a= new ApplicationProperties();
    	a.contextInitialized("1");*/
    	return property.getProperty(key);
    }
    /**
     * Searches for the property with the specified key in this property list.
     * If the key is not found in this property list, the default property list,
     * and its defaults, recursively, are then checked. The method returns the
     * default value argument if the property is not found.
     *
     * @param   key            the hashtable key.
     * @param   defaultValue   a default value.
     *
     * @return  the value in this property list with the specified key value.
     * @see     #setProperty
     * @see     #defaults
     */
    public static String getProperty(String key, String defaultValue) {
    	
    	return property.getProperty(key);
    }
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}
	public void contextInitialized(ServletContextEvent arg0) {
		InputStream is = null;
		
		//system.out.println("tt");
		is = DomainProperties.class.getResourceAsStream(propertyUrl);
		property = new Properties();
		//system.out.println("pp");
		try {
			property.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			LOG.debug(e.getStackTrace());
		}
		// TODO Auto-generated method stub
	}
}
