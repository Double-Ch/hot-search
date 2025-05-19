package com.itchen.service.impl;

import com.itchen.domain.entity.Feedback;
import com.itchen.mapper.FeedbackMapper;
import com.itchen.service.FeedbackService;
import org.springframework.stereotype.Service;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    private final FeedbackMapper feedbackMapper;

    public FeedbackServiceImpl(FeedbackMapper feedbackMapper) {
        this.feedbackMapper = feedbackMapper;
    }

    @Override
    public void saveFeedback(Feedback feedback) {
        feedback.setStatus(0); // 设置初始状态为未处理
        feedbackMapper.insert(feedback);
    }
} 