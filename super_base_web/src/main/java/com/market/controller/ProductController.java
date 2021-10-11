package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.common.constant.PageConstant;
import com.market.common.constant.ResponseStatusConstant;
import com.market.common.exception.ProductTypeExistsException;
import com.market.common.util.DateUtil;
import com.market.common.util.ResponsResult;
import com.market.dto.ProductDto;
import com.market.pojo.Product;
import com.market.pojo.ProductType;
import com.market.service.ProductService;
import com.market.service.ProductTypeService;
import com.market.vo.ProductVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 14:44
 * @Description:
 */
@Controller
@RequestMapping("/base/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductTypeService productTypeService;

    @ModelAttribute("productTypes")
    public List<ProductType> loadProductTypes() {
        List<ProductType> productTypes = productTypeService.findEnable();
        return productTypes;
    }


    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if (pageNum==null) {
            pageNum = PageConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE);
        List<Product> products = productService.findAll();
        PageInfo<Product> pageInfo = new PageInfo<Product>(products);
        model.addAttribute("pageInfo", pageInfo);

        return "productManager";
    }

    @RequestMapping("/findInfo")
    public String findInfo(Integer pageNum, Model model){
        if (pageNum==null) {
            pageNum = PageConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE_FRONT);
        List<Product> products = productService.findAll();
        PageInfo<Product> pageInfo = new PageInfo<Product>(products);
        model.addAttribute("pageInfo", pageInfo);

        return "productInfo";
    }

    @RequestMapping("/findSale")
    public String findSale(Integer pageNum, Model model){
        if (pageNum==null) {
            pageNum = PageConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum,PageConstant.PAGE_SIZE_FRONT);
        List<Product> products = productService.findAll();
        PageInfo<Product> pageInfo = new PageInfo<Product>(products);
        model.addAttribute("pageInfo", pageInfo);

        return "productSale";
    }


//    @RequestMapping("/add")
//    @ResponseBody
//    public String add(HttpServletRequest request, @RequestParam("file") MultipartFile file,String fileName,
//                      Product product,Model model) throws Exception{
//        Date day = new Date();
//        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
//        String batch = df.format(day).toString()+String.valueOf((int)(Math.random()*9000+1000));
//        ProductType productType = new ProductType();
//
//        product.setProductType(productType);
//        product.setpDate(DateUtil.getCurrentDateStr());
//        product.setImage(fileName);
//        product.setBatch(batch);
//        productService.add(product);
//        //如果文件不为空，写入上传路径
//        if(!file.isEmpty()) {
//            //上传文件路径
//            String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
//            //上传文件名
//            String filename = fileName;
//            File filepath = new File(path,filename);
//            //判断路径是否存在，如果不存在就创建一个
//            if (!filepath.getParentFile().exists()) {
//                filepath.getParentFile().mkdirs();
//            }
//            //将上传文件保存到一个目标文件当中
//            file.transferTo(new File(path + File.separator + filename));
//            return "forward:findAll";
//        } else {
//            return "forward:findAll";
//        }
//    }

    //C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\ROOT\WEB-INF\images
      @RequestMapping("/add")
      public String add(ProductVo productVo, HttpSession session,Integer pageNum,Model model){
        String uploadPath = session.getServletContext().getRealPath("/WEB-INF/images");
                System.out.println(uploadPath);
          try {
              ProductDto productDto = new ProductDto();
              Date day = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
              String batch = df.format(day).toString()+String.valueOf((int)(Math.random()*9000+1000));
              //对象属性间的拷贝
              PropertyUtils.copyProperties(productDto,productVo);
              productDto.setBatch(batch);
              productDto.setpDate(DateUtil.getCurrentDateStr());
              productDto.setInputStream(productVo.getFile().getInputStream());
              productDto.setFileName(productVo.getFile().getOriginalFilename());
              productDto.setUploadPath(uploadPath);

              productService.add(productDto);
              model.addAttribute("successMsg","添加成功");
          } catch (Exception e) {
              model.addAttribute("errorMsg",e.getMessage());
          }
          return "forward:findAll";

      }


    /**
     * 检测名称是否已经存在
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String, Object> checkName(String name) {
        Map<String, Object> map = new HashMap<>();
        if (productService.checkName(name)) { //不存在，可用
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "商品（" + name + "）已存在");
        }
        return map;
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponsResult findById(int id){
        Product product = productService.findById(id);
        return ResponsResult.success(product);
    }

    @RequestMapping("/getImage")
    public void getImage(String path, OutputStream outputStream) {
        productService.getImage(path, outputStream);
    }

    @ResponseBody
    @RequestMapping("/updateNumber")
    public Map<String,Object> updateNumber(Product product){
        Map<String, Object> result = new HashMap<>();
        Product productNumber = productService.findById(product.getId());
        product.setSaleNumber(product.getNumber());
        Integer number = productNumber.getNumber() - product.getNumber();
        if (number>0){
            product.setNumber(number);
        }else {
            result.put("success",false);
            result.put("errorInfo","商品数量不足");
            return result;
        }
        productService.updateNum(product);
        result.put("success", true);
        return result;
    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponsResult removeById(int id){
        productService.removeById(id);
        return ResponsResult.success();
    }
}
