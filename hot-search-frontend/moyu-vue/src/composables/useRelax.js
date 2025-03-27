import {ref, onMounted} from 'vue';
import axios from 'axios';

export function useRelaxList() {
    const relaxList = ref([
            {icon: 'https://www.douban.com/favicon.ico', title: '豆瓣', description: '兴趣社区', url: 'https://www.douban.com/ '},
            {icon: 'https://huaban.com/favicon.ico', title: '花瓣网', description: '设计灵感', url: 'https://huaban.com/ '},
            {icon: 'https://www.jianshu.com/favicon.ico', title: '简书', description: '创作与阅读', url: 'https://www.jianshu.com/ '},
            {icon: 'https://www.weibo.com/favicon.ico', title: '微博', description: '实时资讯', url: 'https://weibo.com/ '},
            {icon: '../../public/yikm.logo.png', title: '小霸王', description: '经典游戏', url: 'https://www.yikm.net/ '},
            {icon: 'https://www.bilibili.com/favicon.ico', title: 'B站', description: 'bilibili', url: 'https://www.bilibili.com/'},
            {icon: 'https://www.allhistory.com/favicon.ico', title: '全历史', description: '历史知识', url: 'https://www.allhistory.com/ '},
            {icon: '../../public/wangyiyun-favicon.png', title: '网易云', description: '音乐服务', url: 'https://music.163.com/ '},
        ]
    );

    onMounted(() => {

    });

    return {
        relaxList
    };
}