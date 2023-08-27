package Feature;


import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
public class Runner {
	
	@BeforeClass
	public static void beforeclass() {
		System.setProperty("karate.env", "qa");
	}

}
