package com.msk.wtwt.dto;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class Image {
	private MultipartFile image;
	private int x1;
	private int y1;
	private int x2;
	private int y2;

	public Image() {
		super();
	}

	public Image(MultipartFile image) {
		super();
		this.image = image;
	}

	public Image(MultipartFile image, int x1, int y1, int x2, int y2) {
		super();
		this.image = image;
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public int getX1() {
		return x1;
	}

	public void setX1(int x1) {
		this.x1 = x1;
	}

	public int getY1() {
		return y1;
	}

	public void setY1(int y1) {
		this.y1 = y1;
	}

	public int getX2() {
		return x2;
	}

	public void setX2(int x2) {
		this.x2 = x2;
	}

	public int getY2() {
		return y2;
	}

	public void setY2(int y2) {
		this.y2 = y2;
	}

	@Override
	public String toString() {
		return "Image [image=" + image + ", x1=" + x1 + ", y1=" + y1 + ", x2=" + x2 + ", y2=" + y2 + "]";
	}

	
	public File makeDir() {
		String rootPath = System.getProperty("catalina.home");
		File dir = new File(rootPath + File.separator + "tmpFiles");
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		return dir;
	}
	
	public String makeFileName() {
		String fileName = System.currentTimeMillis() + image.getOriginalFilename();
		return fileName;
	}
	
	public String saveOutfit() throws IllegalStateException, IOException {
		File dir = makeDir();
		String fileName = makeFileName();
		
		File outputFile = new File(dir, fileName);
		image.transferTo(outputFile);
		
		return fileName;
	}
	
	public String cropImage() throws IOException {
		File dir = makeDir();
		String fileName = makeFileName();
		File outputFile = new File(dir, fileName);
		
		String ext = FilenameUtils.getExtension(fileName);

		
		InputStream in = new ByteArrayInputStream(image.getBytes());
		BufferedImage originalImage = ImageIO.read(in);

		BufferedImage croppedImage = originalImage.getSubimage(x1, y1, x2-x1, y2-y1);

		ImageIO.write(croppedImage, ext, outputFile);

		return fileName;
	}
}