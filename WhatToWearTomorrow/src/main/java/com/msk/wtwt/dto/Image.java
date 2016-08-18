package com.msk.wtwt.dto;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

public class Image {
	private MultipartFile image;
	private String imgName;
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


	public Image(String imgName, int x1, int y1, int x2, int y2) {
		super();
		this.imgName = imgName;
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
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

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Override
	public String toString() {
		return "Image [image=" + image + ", imgName=" + imgName + ", x1=" + x1 + ", y1=" + y1 + ", x2=" + x2 + ", y2="
				+ y2 + "]";
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
	
	public String resizeImage() throws IOException {
		File dir = makeDir();
		String fileName = makeFileName();
		File outputFile = new File(dir, fileName);
		
		String ext = FilenameUtils.getExtension(fileName);
		
		InputStream in = new ByteArrayInputStream(image.getBytes());
		BufferedImage originalImage = ImageIO.read(in);
		
		BufferedImage resizeImage = Scalr.resize(originalImage, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH, 225, 400, Scalr.OP_ANTIALIAS);
		
		ImageIO.write(resizeImage, ext, outputFile);
		
		return fileName;
	}
	
	public String cropImageWithImgName() throws IOException {
		File dir = makeDir();
		File outputFile = new File(dir, imgName);
		
		String ext = FilenameUtils.getExtension(imgName);

		
		BufferedImage originalImage = ImageIO.read(outputFile);

		BufferedImage croppedImage = originalImage.getSubimage(x1, y1, x2-x1, y2-y1);

		ImageIO.write(croppedImage, ext, outputFile);

		return imgName;
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