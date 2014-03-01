package app.utils;

import java.util.UUID;

public final class General {

	public static String getUUID() {

		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getUUID());
	}

}
