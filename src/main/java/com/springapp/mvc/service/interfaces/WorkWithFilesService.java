package com.springapp.mvc.service.interfaces;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface WorkWithFilesService {
    public ResponseEntity<byte[]> getPDFOffer(String path, String products, String company, String director, boolean showPrice) throws Exception;
    public ResponseEntity<byte[]> getPDFOfferSingle(String path, String productId, String company, String director, boolean showPrice) throws Exception;
    public void uploadMachines(String path, MultipartFile[] machines);
    public void uploadLathes(String path, MultipartFile[] machines);
    public void uploadImages(String path, MultipartFile[] images);
    public String[] listImage(String path);
    public void removeImage(String path, String image);
}
