import { ref, onMounted } from 'vue';
import axios from 'axios';

export function useHotList() {
  const platforms = ref([
    { name: '百度热榜', logoClass: 'baidu-logo', hotList: [], type: 'baidu', isLoading: true, error: false },
    { name: '抖音热榜', logoClass: 'douyin-logo', hotList: [], type: 'douyin', isLoading: true, error: false },
    { name: '知乎热榜', logoClass: 'zhihu-logo', hotList: [], type: 'zhihu', isLoading: true, error: false },
    { name: 'B站热榜', logoClass: 'bilibili-logo', hotList: [], type: 'bilibili', isLoading: true, error: false },
    { name: '掘金热榜', logoClass: 'juejin-logo', hotList: [], type: 'juejin', isLoading: true, error: false },
    { name: '腾讯网热榜', logoClass: 'tengxunwang-logo', hotList: [], type: 'tengxunwang', isLoading: true, error: false },
    { name: '贴吧热榜', logoClass: 'tieba-logo', hotList: [], type: 'tieba', isLoading: true, error: false },
    { name: '头条热榜', logoClass: 'toutiao-logo', hotList: [], type: 'toutiao', isLoading: true, error: false },
    { name: '微博热榜', logoClass: 'weibo-logo', hotList: [], type: 'weibo', isLoading: true, error: false },
    { name: 'CSDN热榜', logoClass: 'csdn-logo', hotList: [], type: 'csdn', isLoading: true, error: false },
    { name: '搜狗热榜', logoClass: 'sougou-logo', hotList: [], type: 'sougou', isLoading: true, error: false },
    { name: '虎扑步行街热榜', logoClass: 'hupu-logo', hotList: [], type: 'hupu', isLoading: true, error: false }
  ]);

  const loadPlatformData = (platform) => {
    axios.get(`/hotSearch/queryByType/${platform.type}`)
      .then(response => {
        platform.hotList = response.data.data;
        platform.isLoading = false;
        platform.error = false;
      })
      .catch(error => {
        platform.isLoading = false;
        platform.error = true;
        console.error(`获取${platform.name}数据失败`, error);
      });
  };

  onMounted(() => {
    platforms.value.forEach(platform => {
      loadPlatformData(platform);
    });
  });

  return {
    platforms
  };
}