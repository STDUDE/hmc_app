package com.springapp.mvc.web;

import com.springapp.mvc.domain.hmc.Hmc;
import com.springapp.mvc.domain.MachineOrder;
import com.springapp.mvc.service.interfaces.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping()
public class MachineController {
    @Autowired
    private HmcService hmcService;

    @Autowired
    private FiltersService filtersService;

    @Autowired
    private MachineOrderService machineOrderService;

    @Autowired
    private WorkWithFilesService workWithFilesService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(Map<String,Object> map) {
        putMachinesForBlocks(map);
        return new ModelAndView("index", map);
    }

    @RequestMapping(value = "/hmc/authentication", method = RequestMethod.GET)
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

    @RequestMapping(value = "/hmc/authentication", method = RequestMethod.POST)
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
        map.put("brandList", filtersService.listBrandFilter());
        map.put("machineLocationList", filtersService.listMachineLocationFilter());
        map.put("cncList", filtersService.listSystemCNCFilter());
        map.put("slidersList", filtersService.listSlidersFilter());
    }

    private void putMachinesForBlocks(Map<String, Object> map) {
        map.put("randomMachineList", hmcService.randomListMachine());
        map.put("newArrivalsListnewArrivalsList", hmcService.newArrivalsList());
    }

    @RequestMapping(value = "/hmc", method = RequestMethod.GET)
    public void hmc(Map<String, Object> map) {
        List<Hmc> machineList = hmcService.listMachine();
        map.put("machineList", machineList);
        putPagesInfo(map, null, machineList.size());
        putFilters(map);
    }

    @RequestMapping(value = "/hmc", method = RequestMethod.GET, params = {"perPage"})
    public void hmcFiltered(@RequestParam(value = "perPage") String perPage,
                            @RequestParam(value = "brand", required = false) String brands,
                            @RequestParam(value = "location", required = false) String locations,
                            @RequestParam(value = "cnc", required = false) String cncs,
                            @RequestParam(value = "productionYear", required = false) String yearRange,
                            @RequestParam(value = "price", required = false) String priceRange,
                            @RequestParam(value = "xMotion", required = false) String xMotionRange,
                            @RequestParam(value = "yMotion", required = false) String yMotionRange,
                            @RequestParam(value = "zMotion", required = false) String zMotionRange,
                            @RequestParam(value = "xTableSize", required = false) String xTableSizeRange,
                            @RequestParam(value = "yTableSize", required = false) String yTableSizeRange,
                            Map<String, Object> map) {
        List<Hmc> machineList;
        if (brands == null && locations == null && cncs == null && yearRange == null && priceRange == null && xMotionRange == null
                && yMotionRange == null && zMotionRange == null && xTableSizeRange == null && yTableSizeRange == null) {
            machineList = hmcService.listMachine();
        } else {
            machineList = hmcService.listFiltered(brands, yearRange, priceRange, locations, cncs, xMotionRange,
                    yMotionRange, zMotionRange, xTableSizeRange, yTableSizeRange);
        }
        map.put("machineList", machineList);
        putPagesInfo(map, perPage, machineList.size());
        putFilters(map);
    }

    @RequestMapping(value = "/hmc{productId}", method = RequestMethod.GET)
    public ModelAndView machineItem(@PathVariable("productId") String productId, Map<String, Object> map) {
        Hmc machine = hmcService.getMachine(productId);
        if (machine == null) {
            return new ModelAndView("error404");
        }
        map.put("machine", machine);
        return new ModelAndView("hmc/machine", map);
    }

    @RequestMapping(value = "/hmc/compare", method = RequestMethod.GET)
    public void comparison(@RequestParam(required = false) String itemsId, Map<String, Object> map) {
        if (itemsId != null) {
            map.put("comparisonList", hmcService.getMachinesList(itemsId.split(",")));
        }
    }

    @RequestMapping(value = "/hmc/wishList", method = RequestMethod.GET)
    public void wishList(@RequestParam(required = false) String itemsId, Map<String, Object> map) {
        if (itemsId != null) {
            map.put("wishList", hmcService.getMachinesList(itemsId.split(",")));
        }
    }

    @RequestMapping(value = "/hmc/cart", method = RequestMethod.GET)
    public void cart(@RequestParam(required = false) String itemsId, Map<String, Object> map) {
        if (itemsId != null) {
            map.put("cartList", hmcService.getMachinesList(itemsId.split(",")));
        }
    }

    @RequestMapping(value = "/hmc/proposal", method = RequestMethod.GET)
    public void proposal(@RequestParam(required = true) String itemsId, Map<String, Object> map) {
        if (itemsId != null) {
            map.put("proposalList", hmcService.getMachinesList(itemsId.split(",")));
        }
    }

    @RequestMapping(value = "/hmc/proposal", method = RequestMethod.POST)
    public ResponseEntity<byte[]> getPdf(@RequestParam("products") String products,
                                         @RequestParam(value = "company", required = false) String company,
                                         @RequestParam(value = "director", required = false) String director,
                                         @RequestParam("showPrice") String showPrice,
                                         HttpServletRequest request) throws Exception {
        String path = request.getServletContext().getRealPath("") + "/resources";
        return workWithFilesService.getPDFOffer(path, products, company, director, Boolean.getBoolean(showPrice));
    }

    @RequestMapping(value = "/hmc/proposalSingle", method = RequestMethod.GET)
    public void proposalSingle(@RequestParam(required = true) String productId, Map<String, Object> map) {
        map.put("machine", hmcService.getMachine(productId));
    }

    @RequestMapping(value = "/hmc/proposalSingle", method = RequestMethod.POST)
    public ResponseEntity<byte[]> getPdfSingle(@RequestParam("productId") String productId,
                                               @RequestParam(value = "company", required = false) String company,
                                               @RequestParam(value = "director", required = false) String director,
                                               @RequestParam("showPrice") String showPrice,
                                               HttpServletRequest request) throws Exception {
        String path = request.getServletContext().getRealPath("") + "/resources";
        return workWithFilesService.getPDFOfferSingle(path, productId, company, director, Boolean.getBoolean(showPrice));
    }

    @RequestMapping(value = "/hmc/checkout", method = RequestMethod.GET)
    public void checkout(@RequestParam(required = false) String itemsId, Map<String, Object> map) {
        if (itemsId != null) {
            map.put("checkoutList", hmcService.getMachinesList(itemsId.split(",")));
        }
    }

    @RequestMapping(value = "/hmc/checkout", method = RequestMethod.POST)
    public String checkoutOrder(@RequestParam("firstName") String firstName,
                                @RequestParam("lastName") String lastName,
                                @RequestParam(value = "company", required = false) String company,
                                @RequestParam("address") String address,
                                @RequestParam("postcode") String postcode,
                                @RequestParam("email") String email,
                                @RequestParam("phone") String phone,
                                @RequestParam("orderList") String orderList,
                                @RequestParam("total") String total,
                                @RequestParam("payment") String payment,
                                Map<String, Object> map) {
        MachineOrder machineOrder = machineOrderService.addMachineOrder(firstName, lastName, company, address,
                postcode, email, phone, orderList, total, payment);
        emailService.sendNewOrderEmailToCustomer(email, machineOrder);
        emailService.sendNewOrderEmailToAdmin(machineOrder);
        map.put("message", "The order is successfully made. Check your e-mail for information about the ordering.");
        map.put("orderId", machineOrder.getOrderId());
        map.put("emptyTheCart", "yes");
        return "redirect:/hmc/trackYourOrder";
    }

    @RequestMapping(value = "/hmc/trackYourOrder", method = RequestMethod.GET)
    public void trackYourOrder(@RequestParam(value = "message", required = false) String message,
                               @RequestParam(value = "orderId", required = false) String orderId,
                               @RequestParam(value = "emptyTheCart", required = false) String emptyTheCart,
                               Map<String, Object> map) {
        map.put("message", message);
        map.put("orderId", orderId);
        map.put("emptyTheCart", emptyTheCart);
    }

    @RequestMapping(value = "/hmc/trackYourOrder", method = RequestMethod.POST)
    public void trackOrder(@RequestParam("orderId") String orderId, Map<String, Object> map) {
        String status = machineOrderService.getMachineOrderStatus(orderId);
        map.put("message", "Status: " + status);
    }

}