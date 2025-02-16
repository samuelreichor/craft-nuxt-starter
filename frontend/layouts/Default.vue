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
  <QuickEdit/>
</template>
