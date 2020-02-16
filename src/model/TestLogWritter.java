package model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class TestLogWritter {
	private File log;

	public TestLogWritter() {
		File file = new File("TopTrumps.log");
		log = file;
		try {
			if (!file.exists()) {
				file.createNewFile();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void write(String stuff){
		FileWriter fw = null;
		 try {
			fw = new FileWriter(log,true);
			fw.write(stuff);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void clean() {
		try {
			FileWriter fileWriter = new FileWriter(log);
			fileWriter.write("");
			fileWriter.flush();
			fileWriter.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
