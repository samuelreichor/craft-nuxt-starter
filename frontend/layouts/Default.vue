<template>
  <div class="outside-container">
    <nav>
      <slot name="navigation"/>
    </nav>
    <main>
      <slot/>
    </main>
    <footer>
      <slot name="footer"/>
    </footer>
  </div>
  <!-- Show link for editing page -->
  <QuickEdit/>
</template>
