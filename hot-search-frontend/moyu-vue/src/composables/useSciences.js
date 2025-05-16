import {ref, onMounted} from 'vue';
import axios from 'axios';

export function useSciences() {
    const Sciences = ref([
        {icon: "https://www.qbitai.com/wp-content/themes/liangziwei/imgnew/favicon.ico", title: '量子位', description: '聚焦人工智能前沿', url: "https://www.qbitai.com/"},
        {icon: "https://www.huxiu.com/favicon.ico", title: '虎嗅网', description: '创新资讯一网打尽', url: "https://www.huxiu.com/"},
        {icon: "https://www.tmtpost.com/favicon.ico", title: '钛媒体', description: '科技动态早知道', url: "https://www.tmtpost.com/"},
        {icon: "https://36kr.com/favicon.ico", title: '36氪', description: '创业投资风向标', url: "https://36kr.com/"},
        {icon: "https://www.cyzone.cn/img/favicon.ico", title: '创业邦', description: '创业创新好帮手', url: "https://www.cyzone.cn/"},
        {icon: "https://imgslim.geekpark.net/geekpark-icon-196-black.png", title: '极客公园', description: '极客精神创未来', url: "https://www.geekpark.net/"},
        {icon: "https://www.itjuzi.com/favicon.ico", title: 'IT桔子', description: '科技行业动态全掌握', url: "https://www.itjuzi.com/"},
        {icon: "https://cdn-static.sspai.com/favicon/sspai.ico", title: '少数派', description: '高效工作，品质生活', url: "https://sspai.com/"}
    ]);

    const science = 'science';
    const getSciences = () => {
        axios.get(`/MustModule/getMustModule/${science}`)
            .then(response => {
                console.log("获取到sciences:", response.data.data);
                Sciences.value = response.data.data;
            })
            .catch(error => {
                console.log(error);
            });
    };

    onMounted(() => {
        getSciences();
    });

    return {
        Sciences
    };
}