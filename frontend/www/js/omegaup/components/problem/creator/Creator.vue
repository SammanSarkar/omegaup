<template>
  <b-container fluid="lg">
    <b-row>
      <b-col>
        <b-card :header="T.problemCreatorTitle" header-class="h3">
          <creator-header
            @download-zip-file="
              (zipObject) => $emit('download-zip-file', zipObject)
            "
            @upload-zip-file="populateProps"
          />
          <creator-tabs
            :code-prop="codeProp"
            :extension-prop="extensionProp"
            :current-solution-markdown-prop="currentSolutionMarkdownProp"
            :current-markdown-prop="currentMarkdownProp"
            @show-update-success-message="
              () => $emit('show-update-success-message')
            "
            @download-zip-file="
              (zipObject) => $emit('download-zip-file', zipObject)
            "
            @download-input-file="
              (fileObject) => $emit('download-input-file', fileObject)
            "
          />
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import creator_Header from './Header.vue';
import creator_Tabs from './Tabs.vue';
import T from '../../../lang';
@Component({
  components: {
    'creator-header': creator_Header,
    'creator-tabs': creator_Tabs,
  },
})
export default class Creator extends Vue {
  T = T;
  codeProp: string = T.problemCreatorEmpty;
  extensionProp: string = T.problemCreatorEmpty;
  currentSolutionMarkdownProp: string = T.problemCreatorEmpty;
  currentMarkdownProp: string = T.problemCreatorEmpty;

  populateProps(storeData: { [key: string]: any }) {
    this.currentMarkdownProp = storeData.problemMarkdown;
    this.codeProp = storeData.problemCodeContent;
    this.extensionProp = storeData.problemCodeExtension;
    this.currentSolutionMarkdownProp = storeData.problemSolutionMarkdown;
  }
}
</script>
