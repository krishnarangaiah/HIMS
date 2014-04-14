/** ********************************************************************************************************************************************* *
 * 	@author 		Krishna
 *  @project 		HIMS
 *  @createdOn 		11-April-2014
 *  @description 	Test Class for AppTest
 *  ********************************************************************************************************************************************* */

package app.core.components;

import junit.framework.Assert;

import org.junit.Test;

public class AppCacheTest {

	@Test
	public void testSingleton() {
		Assert.assertEquals(AppCache.getInstance(), AppCache.getInstance());
	}

}
