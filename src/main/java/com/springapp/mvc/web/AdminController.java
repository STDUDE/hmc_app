package com.springapp.mvc.web;

import com.springapp.mvc.domain.common.LanguageEntity;
import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.MachineOrder;
import com.springapp.mvc.domain.User;
import com.springapp.mvc.domain.lathe.LatheFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangFullEntity;
import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.LatheShortEntity;
import com.springapp.mvc.service.interfaces.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private HmcService hmcService;

    @Autowired
    private LatheService latheService;

    @Autowired
    private FiltersService filtersService;

    @Autowired
    private LatheFiltersService latheFiltersService;

    @Autowired
    private UserService userService;

    @Autowired
    private WorkWithFilesService workWithFilesService;

    @Autowired
    private MachineOrderService machineOrderService;

    @ModelAttribute("latheShortEntity")
    public LatheLangShortEntity createLatheShortEntity() {
        return new LatheLangShortEntity();
    }

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String admin(HttpServletRequest request) {
        if(request.isUserInRole("ROLE_ADMIN")){
            return "redirect:/admin/hmc";
        }
        return "redirect:/admin/adminEntry";
    }

    @RequestMapping(value = "/adminEntry", method = RequestMethod.GET)
    public void adminEntry(@RequestParam(value = "error", required = false) String error,
                           @RequestParam(value = "logout", required = false) String logout,
                           Map<String,Object> map) {
        if (error != null) {
            map.put("error", "Invalid username or password!");
        }
        if (logout != null) {
            map.put("msg", "You've been logged out successfully.");
        }
    }

    @RequestMapping(value="/users", method = RequestMethod.GET)
    public void users(Map<String,Object> map) {
        List<User> userList = userService.listUsers();
        map.put("userList", userList);
        putPagesInfo(map, userList.size(), 20);
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String changeUserRole(@RequestParam("userId") String num,
                                 @RequestParam("userRole") String role) {
        userService.setUserRole(num, role);
        return "redirect:/admin/users";
    }

    @RequestMapping(value="/hmc", method = RequestMethod.GET)
    public void hmc(Map<String,Object> map) {
        List<Hmc> machineList = hmcService.listMachine();
        map.put("machineList", machineList);
        putPagesInfo(map, machineList.size(), 10);
    }

    @RequestMapping(value="/lathe", method = RequestMethod.GET)
    public void lathe(Map<String,Object> map, Locale locale) {
        List<LatheLangShortEntity> latheListShort = latheService.listLatheLangShort(locale.getLanguage());
        List<LatheLangFullEntity> latheListFull = latheService.listLatheLangFull(locale.getLanguage());
        map.put("latheListShort", latheListShort);
        map.put("latheListFull", latheListFull);
        map.put("latheShortEntity", new LatheLangShortEntity());
        map.put("latheFullEntity", new LatheLangFullEntity());
        putPagesInfo(map, latheListFull.size(), 10);
    }

    private void putPagesInfo(Map<String, Object> map, int itemsNum, int itemsPerPage) {
        int pagesNum = itemsNum / itemsPerPage;
        if (itemsNum % itemsPerPage != 0) {
            pagesNum++;
        }
        map.put("itemsPerPage", itemsPerPage);
        map.put("itemsNum", itemsNum);
        map.put("pagesNum", pagesNum);
    }

    @RequestMapping(value = "/hmc/edit", method = RequestMethod.POST)
    public String editMachine(@ModelAttribute("machine") Hmc machine){
        hmcService.editMachine(machine);
        return "redirect:/admin/hmc";
    }


    @RequestMapping(value = "/lathe/edit", method = RequestMethod.POST)
    public String editLathe(@ModelAttribute("latheShortEntity")LatheLangShortEntity latheShortEntity,
                            BindingResult resultLatheShort1,
                            @ModelAttribute("latheShortEntity.latheLangShortEntityPK.latheShort")LatheShortEntity latheShort,
                            BindingResult resultLatheShort2,
                            @ModelAttribute("latheFullEntity")LatheLangFullEntity latheFullEntity,
                            BindingResult resultLatheFull1,
                            @ModelAttribute("latheFullEntity.latheLangShortEntityPK.latheFull")LatheFullEntity latheFull,
                            BindingResult resultLatheFull2,
                            @ModelAttribute("language") LanguageEntity languageEntity,
                            Locale locale){
        languageEntity.setLang(locale.getLanguage());
        latheShortEntity.getLatheLangShortEntityPK().setLanguage(languageEntity);
        latheShortEntity.getLatheLangShortEntityPK().setLatheShort(latheShort);

        latheFullEntity.getLatheLangFullEntityPK().setLanguage(languageEntity);
        latheFullEntity.getLatheLangFullEntityPK().setLatheFull(latheFull);

        latheService.editLatheLangShort(latheShortEntity);
        latheService.editLatheLangFull(latheFullEntity);
        return "redirect:/admin/lathe";
    }

    @RequestMapping(value = "/hmc/upload", method = RequestMethod.POST)
    public String adminUploadHmcFromFiles(@RequestParam("textFile") MultipartFile[] machines, HttpServletRequest request){
        if (machines != null && machines.length > 0) {
            String path = request.getServletContext().getRealPath("") + "/resources/";
            workWithFilesService.uploadMachines(path, machines);
        }
        return "redirect:/admin/hmc";
    }

    @RequestMapping(value = "/lathe/upload", method = RequestMethod.POST)
    public String adminUploadLatheFromFiles(@RequestParam("textFile") MultipartFile[] lathes, HttpServletRequest request){
        if (lathes != null && lathes.length > 0) {
            String path = request.getServletContext().getRealPath("") + "/resources/";
            workWithFilesService.uploadLathes(path, lathes);
        }
        return "redirect:/admin/lathe";
    }

    @RequestMapping(value = "/hmc/renewFilters", method = RequestMethod.POST)
    public String renewFilters(){
        filtersService.renewFilters();
        return "redirect:/admin/hmc";
    }

    @RequestMapping(value = "/lathe/renewFilters", method = RequestMethod.POST)
    public String renewLatheFilters(){
        latheFiltersService.renewFilters();
        return "redirect:/admin/lathe";
    }

    @RequestMapping(value = "/gallery", method = RequestMethod.GET)
    public void gallery(HttpServletRequest request, Map<String,Object> map){
        String path = request.getServletContext().getRealPath("") + "/resources/images/products";
        map.put("imageList", workWithFilesService.listImage(path));
    }


    @RequestMapping(value = "/gallery/upload", method = RequestMethod.POST)
    public String adminUploadImages(@RequestParam("imageCollection") MultipartFile[] images, HttpServletRequest request){
        if (images != null && images.length > 0) {
            String path = request.getServletContext().getRealPath("") + "/resources/images/products";
            workWithFilesService.uploadImages(path, images);
        }
        return "redirect:/admin/gallery";
    }

    @RequestMapping(value = "/gallery/remove", method = RequestMethod.GET)
    public String removeImage(@RequestParam("image") String image, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("") + "/resources/images/products";
        workWithFilesService.removeImage(path,image);
        return "redirect:/admin/gallery";
    }

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public void orders(Map<String, Object> map) {
        List<MachineOrder> machineOrderList = machineOrderService.listMachineOrder();
        map.put("orderList", machineOrderList);
        putPagesInfo(map, machineOrderList.size(), 10);
    }

    @RequestMapping(value = "/orders", method = RequestMethod.POST)
    public String changeOrderStatus(@RequestParam("orderId") String orderId,
                                  @RequestParam("orderStatus") String orderStatus) {
        machineOrderService.setMachineOrderStatus(orderId, orderStatus);
        return "redirect:/admin/orders";
    }

}
