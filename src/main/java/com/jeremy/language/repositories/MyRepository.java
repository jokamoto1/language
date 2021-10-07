package com.jeremy.language.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jeremy.language.models.Language;


@Repository
public interface  MyRepository extends CrudRepository<Language, Long>{}