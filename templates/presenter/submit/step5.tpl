{**
 * step5.tpl
 *
 * Copyright (c) 2000-2007 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 5 of presenter paper submission.
 *
 * $Id$
 *}
{if $schedConfSettings.acceptSupplementaryReviewMaterials}
{assign var="pageTitle" value="presenter.submit.step5"}
{else}
{assign var="pageTitle" value="presenter.submit.step5SkipSupp"}
{/if}
{include file="presenter/submit/submitHeader.tpl"}

<p>{translate key="presenter.submit.confirmationDescription" conferenceTitle=$conference->getConferenceTitle()}</p>

<form method="post" action="{url op="saveSubmit" path=$submitStep}">
<input type="hidden" name="paperId" value="{$paperId}" />

<h3>{translate key="presenter.submit.filesSummary"}</h3>
<table class="listing" width="100%">
<tr>
	<td colspan="5" class="headseparator">&nbsp;</td>
</tr>
<tr class="heading" valign="bottom">
	<td width="10%">{translate key="common.id"}</td>
	<td width="35%">{translate key="common.originalFileName"}</td>
	<td width="25%">{translate key="common.type"}</td>
	<td width="20%" class="nowrap">{translate key="common.fileSize"}</td>
	<td width="10%" class="nowrap">{translate key="common.dateUploaded"}</td>
</tr>
<tr>
	<td colspan="5" class="headseparator">&nbsp;</td>
</tr>
{foreach from=$files item=file}
<tr valign="top">
	<td>{$file->getFileId()}</td>
	<td><a class="file" href="{url op="download" path=$paperId|to_array:$file->getFileId()}">{$file->getOriginalFileName()|escape}</a></td>
	<td>{if ($file->getType() == 'supp')}{translate key="paper.suppFile"}{else}{translate key="presenter.submit.submissionFile"}{/if}</td>
	<td>{$file->getNiceFileSize()}</td>
	<td>{$file->getDateUploaded()|date_format:$dateFormatTrunc}</td>
</tr>
{foreachelse}
<tr valign="top">
<td colspan="5" class="nodata">{translate key="presenter.submit.noFiles"}</td>
</tr>
{/foreach}
</table>

<div class="separator"></div>

<p><input type="submit" value="{translate key="presenter.submit.finishSubmission"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="confirmAction('{url page="presenter"}', '{translate|escape:"jsparam" key="presenter.submit.cancelSubmission"}')" /></p>

</form>

{include file="common/footer.tpl"}
