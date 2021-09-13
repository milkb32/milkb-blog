<#include "module/default.ftl">
<@default title="搜索 - ${blog_title!}">
<!-- Page Header -->
<header class="intro-header" style="background-image: url('${settings.archives_cover!("${theme_base!}/source/img/home-bg-o.jpg")}">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="site-heading" id="tag-heading">
                    <input class="search-input" placeholder="search for" name="keyword">{${keyword!}}</input>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<#include "module/page.ftl">
<@page title="${blog_title!}" pagetitle="${blog_title!}" slogn="${settings.index_slogn!}" cover="${settings.index_cover!'${theme_base!}/source/img/home-bg.jpg'}">
    <#list posts.content as post>
        <div class="post-preview">
            <a href="${post.fullPath!}">
                <h2 class="post-title">
                    ${post.title!}
                </h2>
                <div class="post-content-preview">
                    ${post.summary}
                </div>
            </a>
            <p class="post-meta">
                Posted by ${user.nickname!} on ${post.createTime?string("MM-dd，yyyy")}
            </p>
        </div>
        <hr>
    </#list>
    <#if posts.totalPages gt 1>
        <ul class="pager">
            <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="0">
                <#if pagination.hasPrev>
                    <li class="previous">
                        <a href="${pagination.prevPageFullPath!}">&larr; Newer Posts</a>
                    </li>
                </#if>
                <#if pagination.hasNext>
                    <li class="next">
                        <a href="${pagination.nextPageFullPath!}">Older Posts &rarr;</a>
                    </li>
                </#if>
            </@paginationTag>
        </ul>
    </#if>
</@page>
</@default>
