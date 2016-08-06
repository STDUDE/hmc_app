package com.springapp.mvc.service.implementions;

import com.springapp.mvc.dao.interfaces.CommonDao;
import com.springapp.mvc.dao.interfaces.HmcDAO;
import com.springapp.mvc.dao.interfaces.LatheDAO;
import com.springapp.mvc.domain.common.LanguageEntity;
import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.lathe.LatheFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.LatheShortEntity;
import com.springapp.mvc.service.interfaces.WorkWithFilesService;
import com.springapp.mvc.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class WorkWithFilesServiceImpl implements WorkWithFilesService {
    @Autowired
    private HmcDAO hmcDAO;

    @Autowired
    private LatheDAO latheDAO;

    @Autowired
    private CommonDao commonDAO;

    @Transactional
    public ResponseEntity<byte[]> getPDFOffer(String path, String products, String company, String director, boolean showPrice) throws Exception {
        String[] productsArr = products.split(";");
        Hmc[] machines = new Hmc[productsArr.length];
        for (int i = 0; i < machines.length; i++) {
            machines[i] = hmcDAO.getMachine(productsArr[i].split(",")[0]);
        }

        String pathPdf = GeneratePdfUtil.createPDF(path, products, machines, company, director, showPrice);

        File file = new File(pathPdf);
        byte[] contents = new byte[(int) file.length()];
        new FileInputStream(file).read(contents);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        String filename = "VMC-HMC-offer.pdf";
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        return new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
    }

    @Transactional
    public ResponseEntity<byte[]> getPDFOfferSingle(String path, String productId, String company, String director, boolean showPrice) throws Exception {
        Hmc machine = hmcDAO.getMachine(productId);

        String pathPdf = GeneratePdfUtil.createPDFSingle(path, machine, company, director, showPrice);

        File file = new File(pathPdf);
        byte[] contents = new byte[(int) file.length()];
        new FileInputStream(file).read(contents);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/pdf"));
        String filename = "VMC-HMC-offer-" + productId + ".pdf";
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        return new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
    }

    @Transactional
    public void uploadMachines(String path, MultipartFile[] machines) {
        for (int i = 0; i < machines.length; i++) {
            try {
                File uploadFile = UploadMultipartFileUtil.uploadFile(path, machines[i]);
                Hmc machine = ReadExcelUtil.readMachine(uploadFile);
                hmcDAO.addMachine(machine);
                uploadFile.delete();
                System.out.println("Successfully uploaded machine: " + machines[i].getOriginalFilename());
            } catch (IOException e) {
                System.out.println("Failed to upload machine file: " + e.getMessage());
            }
        }
    }

    @Transactional
    public void uploadLathes(String path, MultipartFile[] machines) {
        for (int i = 0; i < machines.length; i++) {
            try {
                File uploadFile = UploadMultipartFileUtil.uploadFile(path, machines[i]);
                List<LanguageEntity> languages = commonDAO.listLanguage();
                Map<String, Object> lathes = ReadExcelUtil.readLathes(uploadFile, languages);

                latheDAO.addLatheShort((LatheShortEntity)lathes.get("latheShort"));
                latheDAO.addLatheFull((LatheFullEntity) lathes.get("latheFull"));
                LatheLangShortEntity[] latheLangShort = (LatheLangShortEntity[])lathes.get("latheLangShort");
                LatheLangFullEntity[] latheLangFull = (LatheLangFullEntity[])lathes.get("latheLangFull");
                for (int k = 0; k < latheLangShort.length; k++) {
                    latheDAO.addLatheLangShort(latheLangShort[k]);
                    latheDAO.addLatheLangFull(latheLangFull[k]);
                }

                uploadFile.delete();
                System.out.println("Successfully uploaded lathe: " + machines[i].getOriginalFilename());
            } catch (Exception e) {
                System.out.println("Failed to upload lathe file: " + e.getMessage());
            }
        }
    }

    @Transactional
    public void uploadImages(String path, MultipartFile[] images) {
        for (int i = 0; i < images.length; i++) {
            try {
                UploadMultipartFileUtil.uploadImage(path, images[i]);
                System.out.println("Successfully uploaded photo: " + images[i].getOriginalFilename());
            } catch (IOException e) {
                System.out.println("Failed to upload photo: " + e.getMessage());
            }
        }
    }

    @Transactional
    public String[] listImage(String path) {
        return ImageUtil.getListImage(path);
    }

    @Transactional
    public void removeImage(String path, String image) {
        ImageUtil.removeImage(path, image);
    }

}
