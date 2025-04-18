import { ref, computed, onMounted, onUnmounted } from 'vue';

export function useCountdown() {
  const hours = ref(0);
  const minutes = ref(0);
  const seconds = ref(0);
  const offTime = ref(new Date());
  const offTimeInput = ref('18:00');
  let timer = null;

  // 格式化显示的时间
  const formattedHours = computed(() => hours.value.toString().padStart(2, '0'));
  const formattedMinutes = computed(() => minutes.value.toString().padStart(2, '0'));
  const formattedSeconds = computed(() => seconds.value.toString().padStart(2, '0'));

  // 初始化下班时间
  const initOffTime = () => {
    try {
      const savedTime = localStorage.getItem('offTime');
      if (savedTime) {
        offTime.value = new Date(savedTime);
        offTimeInput.value = `${offTime.value.getHours().toString().padStart(2, '0')}:${offTime.value.getMinutes().toString().padStart(2, '0')}`;
      } else {
        const now = new Date();
        offTime.value = new Date(now);
        offTime.value.setHours(18, 0, 0, 0);
        if (offTime.value <= now) {
          offTime.value.setDate(offTime.value.getDate() + 1);
        }
        localStorage.setItem('offTime', offTime.value.toISOString());
      }
      updateCountdown();
    } catch (error) {
      console.error('Failed to initialize off time:', error);
    }
  };

  // 设置下班时间
  const setOffTime = () => {
    try {
      const [hoursInput, minutesInput] = offTimeInput.value.split(':').map(Number);
      if (isNaN(hoursInput) || isNaN(minutesInput)) {
        throw new Error('Invalid time format');
      }
      
      const now = new Date();
      offTime.value = new Date(now);
      offTime.value.setHours(hoursInput, minutesInput, 0, 0);
      if (offTime.value <= now) {
        offTime.value.setDate(offTime.value.getDate() + 1);
      }
      localStorage.setItem('offTime', offTime.value.toISOString());
      updateCountdown();
    } catch (error) {
      console.error('Failed to set off time:', error);
    }
  };

  // 更新倒计时
  const updateCountdown = () => {
    const now = new Date();
    const workEndTime = offTime.value;
    if (now > workEndTime) {
      offTime.value.setDate(offTime.value.getDate() + 1);
      localStorage.setItem('offTime', offTime.value.toISOString());
    }
    const timeDifference = workEndTime - now;

    hours.value = Math.floor(timeDifference / (1000 * 60 * 60));
    minutes.value = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
    seconds.value = Math.floor((timeDifference % (1000 * 60)) / 1000);

    // 检查是否到达下班时间
    if (timeDifference <= 0) {
      playNotification();
    }
  };

  // 播放通知音效
  const playNotification = () => {
    const audio = new Audio('/notification.mp3');
    audio.play().catch(error => {
      console.error('Failed to play notification:', error);
    });
  };

  // 预设时间快速选择
  const presetTimes = [
    { label: '17:30', value: '17:30' },
    { label: '18:00', value: '18:00' },
    { label: '18:30', value: '18:30' },
    { label: '19:00', value: '19:00' }
  ];

  // 组件挂载时初始化
  onMounted(() => {
    initOffTime();
    timer = setInterval(updateCountdown, 100); // 使用 requestAnimationFrame 优化
  });

  // 组件卸载时清理
  onUnmounted(() => {
    if (timer) {
      clearInterval(timer);
    }
  });

  return {
    hours,
    minutes,
    seconds,
    offTime,
    offTimeInput,
    formattedHours,
    formattedMinutes,
    formattedSeconds,
    setOffTime,
    presetTimes
  };
} 