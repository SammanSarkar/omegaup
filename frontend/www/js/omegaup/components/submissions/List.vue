<template>
  <div
    v-infinite-scroll="() => $emit('fetch-more-data')"
    submissions-problem
    infinite-scroll-disabled="isScrollDisabled"
    infinite-scroll-distance="10"
  >
    <div class="text-center mb-5 submissions-title">
      <h2>
        {{ T.submissionsListTitle }}
      </h2>
      <h4 v-if="!includeUser && submissions.length > 0">
        {{ T.wordsBy }}
        <omegaup-username
          :username="submissions[0].username"
          :classname="submissions[0].classname"
          :linkify="true"
        ></omegaup-username>
      </h4>
    </div>
    <div class="card">
      <div v-if="includeUser" class="card-body d-flex align-items-center">
        <omegaup-common-typeahead
          :existing-options="searchResultUsers"
          :value.sync="searchedUsername"
          :max-results="10"
          class="mr-2"
          @update-existing-options="
            (query) => $emit('update-search-result-users', query)
          "
        />

        <a :href="hrefSearchUser">
          <button class="btn btn-primary" type="button">
            {{ T.searchUser }}
          </button>
        </a>
      </div>
      <div class="table-responsive">
        <table class="table mb-0 submissions-table">
          <thead>
            <tr>
              <th scope="col" class="text-center">{{ T.wordsTime }}</th>
              <th v-if="includeUser" scope="col" class="text-center">
                {{ T.submissionsListCoder }}
              </th>
              <th scope="col" class="text-center">{{ T.wordsProblem }}</th>
              <th
                :class="{ 'fixed-width-column': includeUser }"
                class="text-center"
                scope="col"
              >
                {{ T.wordsLanguage }}
              </th>
              <th scope="col" class="text-center fixed-with-column">
                {{ T.wordsVerdict }}
              </th>
              <th scope="col" class="text-right">{{ T.wordsRuntime }}</th>
              <th scope="col" class="text-right">{{ T.wordsMemory }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="submission in submissions" :key="submission.guid">
              <td class="text-center">
                {{ time.formatDateTime(submission.time) }}
              </td>
              <td v-if="includeUser" class="text-center">
                <omegaup-username
                  :username="submission.username"
                  :classname="submission.classname"
                  :linkify="true"
                >
                </omegaup-username>
                <br />
                <a
                  class="school-text"
                  :href="`/schools/profile/${submission.school_id}/`"
                  >{{ submission.school_name }}</a
                >
              </td>
              <td class="text-center">
                <a :href="`/arena/problem/${submission.alias}/`">{{
                  submission.title
                }}</a>
              </td>
              <td class="text-center">{{ submission.language }}</td>
              <td
                class="text-center verdict"
                :class="`verdict-${submission.verdict}`"
              >
                {{ T[`verdict${submission.verdict}`] }}
              </td>
              <td class="text-center">
                {{
                  submission.runtime === 0
                    ? '—'
                    : ui.formatString(T.submissionRunTimeInSeconds, {
                        value: (
                          parseFloat(submission.runtime || '0') / 1000
                        ).toFixed(2),
                      })
                }}
              </td>
              <td class="text-center">
                {{
                  submission.memory === 0
                    ? '—'
                    : ui.formatString(T.submissionMemoryInMegabytes, {
                        value: (
                          parseFloat(submission.memory) /
                          (1024 * 1024)
                        ).toFixed(2),
                      })
                }}
              </td>
            </tr>
            <template v-if="loading">
              <tr v-for="index in 3" :key="index">
                <td colspan="16">
                  <div class="line"></div>
                </td>
              </tr>
            </template>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from 'vue-property-decorator';
import { types } from '../../api_types';
import T from '../../lang';
import * as ui from '../../ui';
import * as time from '../../time';
import UserName from '../user/Username.vue';
import common_Typeahead from '../common/Typeahead.vue';
import common_Paginator from '../common/Paginator.vue';
import infiniteScroll from 'vue-infinite-scroll';

@Component({
  components: {
    'omegaup-username': UserName,
    'omegaup-common-typeahead': common_Typeahead,
    'omegaup-common-paginator': common_Paginator,
  },
  directives: {
    infiniteScroll,
  },
})
export default class SubmissionsList extends Vue {
  @Prop() page!: number;
  @Prop() includeUser!: boolean;
  @Prop() submissions!: types.Submission[];
  @Prop() searchResultUsers!: types.ListItem[];
  @Prop() loading!: boolean;
  @Prop() endOfResults!: boolean;

  T = T;
  ui = ui;
  time = time;
  searchedUsername: types.ListItem | null = null;

  get hrefSearchUser(): string {
    if (!this.searchedUsername?.key) {
      return '/submissions/';
    }
    return `/submissions/${encodeURIComponent(this.searchedUsername?.key)}/`;
  }
  get isScrollDisabled() {
    return this.loading || this.endOfResults;
  }
}
</script>

<style lang="scss">
@import '../../../../sass/main.scss';

table.submissions-table > tbody > tr > td {
  vertical-align: middle;
}

.verdict-AC {
  background: var(--arena-submissions-list-verdict-ac-background-color);
}

.verdict-WA {
  background: var(--arena-runs-table-status-wa-background-color);
}

.verdict-MLE {
  background: var(--arena-runs-table-status-mle-background-color);
}

.verdict-TLE {
  background: var(--arena-runs-table-status-tle-background-color);
}

.verdict-CE {
  background: var(--arena-submissions-list-verdict-ce-background-color);
}

.verdict-JE,
.verdict-VE {
  background: var(--arena-submissions-list-verdict-je-ve-background-color);
}

.verdict-PA {
  background: var(--arena-runs-table-status-pa-background-color);
}

.verdict-OLE {
  background: var(--arena-runs-table-status-ole-background-color);
}

.verdict-RTE {
  background: var(--arena-runs-table-status-rte-background-color);
}

.verdict-RFE {
  background: var(--arena-runs-table-status-rfe-background-color);
}

.school-text {
  font-size: 0.9em;
}

.fixed-width-column {
  width: 180px;
}

.submissions-title h2 {
  font-size: 1.8rem;
}

[submissions-problem] .tags-input-wrapper-default {
  padding: 0.35rem 0.25rem 0.7rem 0.25rem;
}
.line {
  height: 49px;
  background: var(
    --arena-submissions-list-skeletonloader-final-background-color
  );
  border-radius: 8px;
  animation: loading 1.5s infinite;
}
@keyframes loading {
  0% {
    background: var(
      --arena-submissions-list-skeletonloader-initial-background-color
    );
  }
  50% {
    background: var(
      --arena-submissions-list-skeletonloader-final-background-color
    );
  }
  100% {
    background: var(
      --arena-submissions-list-skeletonloader-initial-background-color
    );
  }
}
</style>
