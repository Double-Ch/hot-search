package com.itchen.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.domain.Platform;
import com.itchen.mapper.PlatformMapper;
import com.itchen.service.PlatformService;
import org.springframework.stereotype.Service;

@Service
public class PlatformServiceImpl extends ServiceImpl<PlatformMapper, Platform> implements PlatformService {
}