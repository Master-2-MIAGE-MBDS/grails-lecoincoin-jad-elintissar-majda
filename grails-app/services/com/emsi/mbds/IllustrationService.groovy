package com.emsi.mbds
import grails.gorm.services.Service
import org.springframework.web.multipart.MultipartFile

@Service(Illustration)
interface IllustrationService {

    Illustration get(Serializable id)

    List<Illustration> list(Map args)

    Long count()

    void delete(Serializable id)

    Illustration save(Illustration illustration)

}