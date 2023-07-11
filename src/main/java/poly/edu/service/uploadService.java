package poly.edu.service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class uploadService {
	public static String saveFile(String uploadDir, MultipartFile multipartFile) throws IOException {
	    Path path = Paths.get(uploadDir);
	    if (!Files.exists(path)) {
	        Files.createDirectories(path);
	    }
	    
	    String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	    Path filePath = path.resolve(fileName);

	    if (Files.exists(filePath)) {
	        String baseName = FilenameUtils.getBaseName(fileName);
	        String extension = FilenameUtils.getExtension(fileName);
	        String newFileName = baseName + "_" + System.currentTimeMillis() + "." + extension;
	        filePath = path.resolve(newFileName);
	    }

	    try (InputStream inputStream = multipartFile.getInputStream()) {
	        Files.copy(inputStream, filePath);
	    } catch (Exception e) {
	        throw new IOException("Could not save image file " + fileName);
	    }
	return fileName;
	}
}
