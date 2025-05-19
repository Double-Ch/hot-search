package com.itchen.controller.hot;

import com.itchen.domain.entity.Feedback;
import com.itchen.service.FeedbackService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author chen
 * @description 反馈建议Controller
 */
@RestController
@RequestMapping("/feedback")
@Tag(name = "热搜数据-拉取管理")
public class FeedbackController {

    private final FeedbackService feedbackService;

    public FeedbackController(FeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @PostMapping("save")
    @Operation(summary = "保存反馈建议")
    public ResponseEntity<?> submitFeedback(@RequestBody Feedback feedback) {
        feedbackService.saveFeedback(feedback);
        return ResponseEntity.ok().build();
    }
} 