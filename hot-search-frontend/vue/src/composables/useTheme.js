import { ref, onMounted } from 'vue';

export function useTheme() {
  const themeIcon = ref('🌞');

  const checkLocalStorageTheme = () => {
    const savedTheme = localStorage.getItem('appTheme');
    if (savedTheme === 'dark') {
      document.body.classList.add('dark-theme');
      themeIcon.value = '🌙';
    }
  };

  const toggleTheme = () => {
    const body = document.body;
    if (body.classList.contains('dark-theme')) {
      body.classList.remove('dark-theme');
      themeIcon.value = '🌞';
      localStorage.setItem('appTheme', 'light');
    } else {
      body.classList.add('dark-theme');
      themeIcon.value = '🌙';
      localStorage.setItem('appTheme', 'dark');
    }
  };

  onMounted(() => {
    checkLocalStorageTheme();
  });

  return {
    themeIcon,
    toggleTheme
  };
}