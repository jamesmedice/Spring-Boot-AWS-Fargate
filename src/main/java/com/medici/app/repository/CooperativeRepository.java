package com.medici.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.medici.app.entity.Cooperative;

@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "cooperatives", path = "cooperatives")
public interface CooperativeRepository extends JpaRepository<Cooperative, Long> {

}
