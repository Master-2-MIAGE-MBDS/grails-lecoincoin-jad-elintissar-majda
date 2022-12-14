package com.emsi.mbds

import grails.gorm.services.Service
import org.springframework.web.multipart.MultipartFile

@Service(Annonce)
interface AnnonceService {

    Annonce get(Serializable id)

    List<Annonce> list(Map args)

    Long count()

    void delete(Serializable id)

    Annonce save(Annonce annonce)


}