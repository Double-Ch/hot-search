package com.itchen.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * @author chen
 * @description 功能描述
 * @create 2025/1/14 16:41
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class PageResult<T> implements Serializable {
    /**
     * 总数
     */
    private Long total;
    private List<T> list;

    public PageResult(IPage<T> page) {
        this.total = page.getTotal();
        this.list = page.getRecords();
    }
}
