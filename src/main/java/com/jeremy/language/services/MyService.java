package com.jeremy.language.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jeremy.language.repositories.MyRepository;
import com.jeremy.language.models.Language;
@Service
public class MyService {

		private final MyRepository repo;
	    
	    public MyService(MyRepository repo) {
	        this.repo = repo;
	    }

	    public List<Language> all() {
	        return (List<Language>) repo.findAll();
	    }
	 
	    public Language create(Language e) {
	        return repo.save(e);
	    }
	    public void delete(Long id) {
	    	 repo.deleteById(id);
	    }
//
	    public Language findOne(Long id) {
	        Optional<Language> opLang = repo.findById(id);
	        if(opLang.isPresent()) {
	            return opLang.get();
	        } else {
	            return null;
	        }
	    }

}
