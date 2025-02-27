package com.itchen.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itchen.domain.HotSearchItem;
import com.itchen.mapper.HotSearchItemMapper;
import com.itchen.service.HotSearchItemService;
import org.springframework.stereotype.Service;

@Service
public class HotSearchItemServiceImpl extends ServiceImpl<HotSearchItemMapper, HotSearchItem> implements HotSearchItemService {
}