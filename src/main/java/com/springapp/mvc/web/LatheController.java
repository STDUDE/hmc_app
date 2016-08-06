package com.springapp.mvc.web;

import com.springapp.mvc.domain.lathe.LatheLangShortEntity;
import com.springapp.mvc.domain.lathe.SlidersLatheFilterEntity;
import com.springapp.mvc.service.interfaces.LatheFiltersService;
import com.springapp.mvc.service.interfaces.LatheService;
import com.springapp.mvc.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping()
public class LatheController {
    @Autowired
    private LatheService latheService;

    @Autowired
    private LatheFiltersService latheFiltersService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/lathe", method = RequestMethod.GET)
    public void lathe(Map<String, Object> map, Locale locale) {
        List<LatheLangShortEntity> latheShortList = latheService.listLatheLangShort(locale.getLanguage());
        map.put("latheShortList", latheShortList);
        putPagesInfo(map, null, latheShortList.size());
        putFilters(map);
    }

    @RequestMapping(value = "/lathe/authentication", method = RequestMethod.GET)
    public void authentication(@RequestParam(value = "error", required = false) String error,
                               @RequestParam(value = "logout", required = false) String logout,
                               Map<String, Object> map) {
        if (error != null) {
            map.put("error", "Invalid username or password!");
        }
        if (logout != null) {
            map.put("msg", "You've been logged out successfully.");
        }
    }

    @RequestMapping(value = "/lathe/authentication", method = RequestMethod.POST)
    public void createNewAccount(@RequestParam(value = "username") String username,
                                 @RequestParam(value = "password") String password,
                                 @RequestParam(value = "email") String email,
                                 Map<String, Object> map) {
        userService.createNewAccount(username, password, email, "ROLE_USER");
        map.put("msg", "You've been registered successfully.");
    }

    private void putPagesInfo(Map<String, Object> map, String perPage, int itemsNum) {
        int itemsPerPage = (perPage == null) ? 9 : Integer.parseInt(perPage);
        int pagesNum = itemsNum / itemsPerPage;
        if (itemsNum % itemsPerPage != 0) {
            pagesNum++;
        }
        map.put("itemsPerPage", itemsPerPage);
        map.put("itemsNum", itemsNum);
        map.put("pagesNum", pagesNum);
    }

    private void putFilters(Map<String, Object> map) {
        map.put("brandList", latheFiltersService.listBrandLatheFilter());
        map.put("machineLocationList", latheFiltersService.listMachineLocationLatheFilter());
        map.put("cncList", latheFiltersService.listSystemCncLatheFilter());
        map.put("sliders", latheFiltersService.listSlidersLatheFilter());
    }


}