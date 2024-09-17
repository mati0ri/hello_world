import { describe, it, expect } from 'vitest';
import { mount } from '@vue/test-utils';
import HelloWorld from '@/components/HelloWorld.vue';
import { nextTick } from 'vue';

describe('HelloWorld.vue', () => {
  it('should have a Hello World message when clicking on the button', async () => {
    const wrapper = mount(HelloWorld);
    
    // Simule un clic sur le bouton
    wrapper.find('button').trigger('click');
    
    // Attends que le DOM se mette à jour
    await nextTick();
    
    // Vérifie que l'élément <h1> contient bien le texte "Hello World"
    expect(wrapper.find('h1').text()).toBe('Hello World');
  });
});
