package ru.hh.homework.at_least_some_backend.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import ru.hh.homework.at_least_some_backend.dao.HHUserDao;
import ru.hh.homework.at_least_some_backend.resource.HHUserResource;
import ru.hh.homework.at_least_some_backend.resource.HelloWorldResource;
import ru.hh.homework.at_least_some_backend.service.HHUserService;

@Configuration
@Import({
        HHUserDao.class,
        HHUserService.class,
        HHUserResource.class,

        HelloWorldResource.class
})
public class Services { }