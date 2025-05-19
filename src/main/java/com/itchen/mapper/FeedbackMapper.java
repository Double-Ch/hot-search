package com.itchen.mapper;

import com.itchen.domain.entity.Feedback;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Insert;

@Mapper
public interface FeedbackMapper {
    
    @Insert("INSERT INTO feedback_tbl (content, contact, create_time, status) " +
            "VALUES (#{content}, #{contact}, NOW(), #{status})")
    void insert(Feedback feedback);
} 