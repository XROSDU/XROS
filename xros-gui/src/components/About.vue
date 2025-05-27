<script setup lang="ts">
import { getXROSVersion } from '~/composables/network'

const { t } = useI18n()

const etVersion = ref('')

onMounted(async () => {
  etVersion.value = await getXROSVersion()
})
</script>

<template>
  <Card>
    <template #title>
      XROS - {{ t('about.version') }}: {{ etVersion }}
    </template>
    <template #content>
      <p class="mb-1">
        {{ t('about.description') }}
      </p>
    </template>
  </Card>
</template>

<style scoped lang="postcss">
</style>
