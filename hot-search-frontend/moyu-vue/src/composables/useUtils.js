import {ref, onMounted} from 'vue';
import axios from 'axios';

export function useUtils() {
    const utils = ref([
        {icon: "https://www.youyan3d.com/favicon.ico", title: '有言AI', description: 'AI创作好帮手', url: "https://www.youyan3d.com/platform"},
        {icon: "https://www.ihuiwa.com/favicon.ico", title: '绘蛙', description: 'AI绘画新体验', url: "https://www.ihuiwa.com/workspace/ai-video/from-image?huiwaInviteCode=EUPJSL"},
        {icon: "https://cli.im/favicon.ico", title: '草料二维码', description: '二维码制作轻松做', url: "https://cli.im/"},
        {icon: "https://www.uisdc.com/favicon.ico", title: '配色导航', description: '配色设计好帮手', url: "https://hao.uisdc.com/color/"},
        {icon: "https://www.lingdaima.com/favicon.ico", title: '零代码', description: '开发神器', url: "https://www.lingdaima.com/"},
        {icon: "https://cdn.brmgo.cn/static/images/logo-icon.png", title: '白日梦AI', description: '创意激发好帮手', url: "https://aibrm.com/?code=fx_cdo"},
        {icon: "https://www.ajihuo.com/favicon.ico", title: '爱激活', description: '软件激活全掌握', url: "https://www.ajihuo.com/"}
    ]);

    const util = 'util';
    const getUtils = () => {
        axios.get(`/MustModule/getMustModule/${util}`)
            .then(response => {
                console.log("获取到utils:", response.data.data);
                utils.value = response.data.data;
            })
            .catch(error => {
                console.log(error);
            });
    };

    onMounted(() => {
        getUtils();
    });

    return {
        utils
    };
}