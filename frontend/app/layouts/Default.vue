<template>
  <div class="outside-container">
    <nav>
      <slot name="navigation" />
    </nav>
    <main>
      <slot />
    </main>
    <footer>
      <slot name="footer" />
    </footer>
    <!-- Show link for editing page -->
    <LazyQuickEdit />
  </div>
</template>
