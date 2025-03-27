import {ref, onMounted} from 'vue';
import axios from 'axios';

export function useLifeTips() {
    const lifeTips = ref([
        {icon: 'https://www.xiachufang.com/favicon.ico', title: '下厨房', description: '家常菜谱分享', url: 'https://www.xiachufang.com/'},
        {icon: 'https://www.douguo.com/favicon.ico', title: '豆果美食', description: '美食菜谱社区', url: 'https://www.douguo.com/'},
        {icon: '../../public/haohaozhu.favicon.ico', title: '好好住', description: '家居装修社区', url: 'https://www.haohaozhu.cn/community/discover/keting'},
        {icon: 'https://www.yidoutang.com/favicon.ico', title: '一兜糖', description: '家居生活社区', url: 'https://www.yidoutang.com/case/'},
        {icon: 'https://dxy.com/favicon.ico', title: '丁香医生', description: '健康生活平台', url: 'https://dxy.com/'},
        {icon: 'https://www.babytree.com/favicon.ico', title: '宝宝树', description: '育儿交流社区', url: 'https://www.babytree.com/index.php'},
        {icon: 'https://www.mafengwo.cn/favicon.ico', title: '马蜂窝', description: '旅游攻略社区', url: 'https://www.mafengwo.cn/'},
        {icon: 'https://www.youxiake.com/favicon.ico', title: '游侠客', description: '旅行分享平台', url: 'https://www.youxiake.com/'},
    ]);

    onMounted(() => {

    });

    return {
        lifeTips
    };
}