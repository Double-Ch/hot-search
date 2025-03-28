import {ref, onMounted} from 'vue';
import axios from 'axios';

export function useRelaxList() {
    const relaxList = ref([
        {icon: "https://www.douban.com/favicon.ico", title: '豆瓣', description: '兴趣社区', url: "https://www.douban.com/"},
        {icon: "https://huaban.com/favicon.ico", title: '花瓣网', description: '设计灵感随心找', url: "https://huaban.com/"},
        {icon: "https://www.jianshu.com/favicon.ico", title: '简书', description: '创作阅读好去处', url: "https://www.jianshu.com/"},
        {icon: "https://www.weibo.com/favicon.ico", title: '微博', description: '实时资讯', url: "https://weibo.com/"},
        {icon: "https://www.helloimg.com/i/2025/03/27/67e520f36e266.png", title: '小霸王', description: '经典游戏回忆杀', url: "https://www.yikm.net/"},
        {icon: "https://www.bilibili.com/favicon.ico", title: 'B站', description: '趣味视频乐无边', url: "https://www.bilibili.com/"},
        {icon: "https://www.allhistory.com/favicon.ico", title: '全历史', description: '历史知识大宝藏', url: "https://www.allhistory.com/"},
        {icon: "https://www.xiaohongshu.com/favicon.ico", title: '小红书', description: '你的生活指南', url: "https://www.xiaohongshu.com/explore"}
    ]);

    const relax = 'relax';
    const getRelaxList = () => {
        axios.get(`/MustModule/getMustModule/${relax}`)
            .then(response => {
                console.log("获取到relax:", response.data.data);
                relaxList.value = response.data.data;
            })
            .catch(error => {
                console.log(error);
            });
    };

    onMounted(() => {
        getRelaxList();
    });

    return {
        relaxList
    };
}