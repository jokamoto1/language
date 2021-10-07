package com.jeremy.language.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeremy.language.models.Language;
import com.jeremy.language.services.MyService;

@Controller
public class MyController {
	
	@Autowired
	MyService  service;

		@RequestMapping("/")
		public String viewAll(Model model,  @ModelAttribute("language") Language language) {
	    	List<Language> languages = service.all();
	    	model.addAttribute("languages" , languages);
	    	return "dashboard.jsp";	
		}
		@PostMapping("/create")
		public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model){
	  		if (result.hasErrors()) {
    			List<Language> languages = service.all();
    	    	model.addAttribute("languages" , languages);
    	    	model.addAttribute("language");
    			return "dashboard.jsp";
    		}
	  		service.create(language);
	  		return "redirect:/";
		}
	    @RequestMapping("/edits/{id}")
	    public String edit(Model model,@PathVariable("id") Long id , @Valid @ModelAttribute("language") Language language, BindingResult result ) {
	    	if (result.hasErrors()) {
	    		Language oneLanguage = service.findOne(id);
	    		model.addAttribute("oneLanguage" , oneLanguage);
		    	model.addAttribute("langauge");
				return "edit.jsp";
			}
	    	service.create(language);
	    	return "redirect:/";	
	    }
	    @RequestMapping("/edit/{id}")
	    public String showEdit(Model model,@PathVariable("id") Long id , @ModelAttribute("language") Language language) {
	    	Language oneLanguage = service.findOne(id);
	    	model.addAttribute("oneLanguage" , oneLanguage);
	    	return "edit.jsp";	
	    }
	    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	    public String destroy(@PathVariable("id") Long id) {
	        service.delete(id);
	        return "redirect:/";
	    }
		@GetMapping("/view/{id}")
		public String view(Model model,@PathVariable("id") Long id) {
			Language language = service.findOne(id);
			model.addAttribute(language);
			return "view.jsp";
		}

}
