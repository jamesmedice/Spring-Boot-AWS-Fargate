package com.medici.app.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.medici.app.entity.Cooperative;
import com.medici.app.repository.CooperativeRepository;

@Configuration
@EntityScan(basePackageClasses = { Cooperative.class })
@EnableJpaRepositories(basePackageClasses = { CooperativeRepository.class })
@EnableAutoConfiguration
public class AutoConfiguration {

}
